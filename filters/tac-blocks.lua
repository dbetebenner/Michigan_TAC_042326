--- tac-blocks.lua — render the corpus's custom block components in PDF.
--
-- The HTML theme styles .di-editorial, .di-stats/.di-stat and .tac-recommendation
-- with CSS. LaTeX has no equivalent, so without this filter those divs degrade to
-- undifferentiated paragraphs and the PDF loses structure the HTML has.
--
-- Each maps to an environment declared in styles/tac-preamble.tex, so the two
-- output channels stay one design system.

if not FORMAT:match('latex') then return {} end

local function raw(s) return pandoc.RawBlock('latex', s) end

local function wrap(env, blocks)
  local out = pandoc.List()
  out:insert(raw('\\begin{' .. env .. '}'))
  out:extend(blocks)
  out:insert(raw('\\end{' .. env .. '}'))
  return out
end

--- Flatten one .di-stat into its value and label.
-- The corpus authors these as bracketed spans inside a paragraph
-- ([5,613]{.di-stat-value}), not as nested divs, so walk inlines for Spans and
-- accept nested Divs as a fallback.
local function stat_lines(div)
  local value, label
  local function take(el)
    if el.classes:includes('di-stat-value') then
      value = pandoc.utils.stringify(el)
    elseif el.classes:includes('di-stat-label') then
      label = pandoc.utils.stringify(el)
    end
  end
  pandoc.walk_block(div, {
    Span = function(sp) take(sp) end,
    Div  = function(d)  take(d)  end,
  })
  return value, label
end

return {
  {
    Div = function(div)
      if div.classes:includes('di-editorial') then
        return wrap('editorial', div.content)
      end

      if div.classes:includes('tac-recommendation') then
        return wrap('tacrec', div.content)
      end

      if div.classes:includes('di-stats') then
        -- Build a single centred row of value/label pairs separated by rules.
        local cells = pandoc.List()
        for _, b in ipairs(div.content) do
          if b.t == 'Div' and b.classes:includes('di-stat') then
            local v, l = stat_lines(b)
            if v then
              cells:insert('\\begin{minipage}[t]{0.30\\linewidth}\\raggedright'
                .. '\\statvalue{' .. v .. '}\\par\\vspace{2pt}'
                .. '\\statlabel{' .. (l or '') .. '}\\end{minipage}')
            end
          end
        end
        if #cells == 0 then return nil end
        local body = table.concat(cells, '\\hfill')
        return { raw('\\begin{statrow}\\noindent ' .. body .. '\\end{statrow}') }
      end

      return nil
    end,
  },
}
