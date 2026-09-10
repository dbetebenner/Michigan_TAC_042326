import sys, zipfile, re, xml.etree.ElementTree as ET
NS={'a':'http://schemas.openxmlformats.org/drawingml/2006/main',
    'p':'http://schemas.openxmlformats.org/presentationml/2006/main',
    'r':'http://schemas.openxmlformats.org/officeDocument/2006/relationships'}
def texts(root):
    out=[]
    for para in root.iter('{%s}p'%NS['a']):
        s=''.join(t.text or '' for t in para.iter('{%s}t'%NS['a'])).strip()
        if s: out.append(s)
    return out
path=sys.argv[1]
z=zipfile.ZipFile(path)
slides=sorted([n for n in z.namelist() if re.match(r'ppt/slides/slide\d+\.xml$',n)],
              key=lambda n:int(re.search(r'(\d+)',n.split('/')[-1]).group(1)))
for s in slides:
    num=int(re.search(r'(\d+)',s.split('/')[-1]).group(1))
    root=ET.fromstring(z.read(s))
    hidden = root.get('show')=='0'
    print(f"\n===== SLIDE {num}{' [HIDDEN]' if hidden else ''} =====")
    for t in texts(root): print(' ',t)
    # notes
    rel=f'ppt/slides/_rels/slide{num}.xml.rels'
    if rel in z.namelist():
        rr=ET.fromstring(z.read(rel))
        for r in rr:
            tgt=r.get('Target','')
            if 'notesSlide' in tgt:
                np='ppt/notesSlides/'+tgt.split('/')[-1]
                if np in z.namelist():
                    nt=[x for x in texts(ET.fromstring(z.read(np))) if not x.isdigit()]
                    if nt:
                        print(f"  --- NOTES {num} ---")
                        for t in nt: print('   >',t)
