((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,E,B={dC:function dC(){},eg:function eg(){},h9:function h9(){},hO:function hO(d){this.b=0
this.c=d},az:function az(d){this.a=d},cY:function cY(){this.d="bug"
this.e=""
this.c=null},hn:function hn(d){this.a=d},hp:function hp(){},hq:function hq(d){this.a=d},ho:function ho(d,e){this.a=d
this.b=e},hr:function hr(d){this.a=d},
kG(d,e,f,g,h){return new B.bX(h,g,f,e,d,null)},
kL(d,e){return new B.eZ(e,d,null)},
c0(d,e){return new B.f2(e,d,null)},
kR(d,e,f,g,h){return new B.f7(h,g,f,e,d,null)},
bX:function bX(d,e,f,g,h,i){var _=this
_.e=d
_.f=e
_.w=f
_.y=g
_.Q=h
_.a=i},
fn:function fn(d,e){this.a=d
this.b=e},
eU:function eU(d,e,f,g){var _=this
_.z=d
_.at=e
_.ax=f
_.a=g},
eZ:function eZ(d,e,f){this.e=d
this.x=e
this.a=f},
f2:function f2(d,e,f){this.d=d
this.Q=e
this.a=f},
f7:function f7(d,e,f,g,h,i){var _=this
_.d=d
_.Q=e
_.at=f
_.ay=g
_.CW=h
_.a=i},
f9:function f9(d,e,f,g,h){var _=this
_.CW=d
_.cy=e
_.db=f
_.dx=g
_.a=h},
ak:function ak(){},
X:function X(){},
e6:function e6(d,e,f,g){var _=this
_.ry=d
_.to=null
_.x1=!1
_.c=_.b=_.a=_.cy=null
_.d=e
_.e=null
_.f=f
_.w=_.r=null
_.x=g
_.Q=_.z=_.y=null
_.as=!1
_.at=!0
_.ax=!1
_.CW=null
_.cx=!1},
kg(d,e,f,g){var x,w,v,u,t,s="0123456789ABCDEF"
if(f===D.n){x=$.l4()
x=x.b.test(e)}else x=!1
if(x)return e
w=D.X.d0(e)
for(x=w.length,v=0,u="";v<x;++v){t=w[v]
if(t<128&&("\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\u03f6\x00\u0404\u03f4 \u03f4\u03f6\u01f6\u01f6\u03f6\u03fc\u01f4\u03ff\u03ff\u0584\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u05d4\u01f4\x00\u01f4\x00\u0504\u05c4\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u0400\x00\u0400\u0200\u03f7\u0200\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u03ff\u0200\u0200\u0200\u03f7\x00".charCodeAt(t)&d)!==0)u+=A.m3(t)
else u=u+"%"+s[t>>>4&15]+s[t&15]}return u.charCodeAt(0)==0?u:u}},D,C
J=c[1]
A=c[0]
E=c[2]
B=a.updateHolder(c[6],B)
D=c[11]
C=c[8]
B.dC.prototype={}
B.eg.prototype={}
B.h9.prototype={
d0(d){var x,w,v,u,t=d.length,s=A.iT(0,null,t)
if(s===0)return new Uint8Array(0)
x=s*3
w=new Uint8Array(x)
v=new B.hO(w)
if(v.ct(d,0,s)!==s){u=s-1
if(!(u>=0&&u<t))return A.l(d,u)
v.b6()}return new Uint8Array(w.subarray(0,A.mL(0,v.b,x)))}}
B.hO.prototype={
b6(){var x,w=this,v=w.c,u=w.b,t=w.b=u+1
v.$flags&2&&A.a9(v)
x=v.length
if(!(u<x))return A.l(v,u)
v[u]=239
u=w.b=t+1
if(!(t<x))return A.l(v,t)
v[t]=191
w.b=u+1
if(!(u<x))return A.l(v,u)
v[u]=189},
cU(d,e){var x,w,v,u,t,s=this
if((e&64512)===56320){x=65536+((d&1023)<<10)|e&1023
w=s.c
v=s.b
u=s.b=v+1
w.$flags&2&&A.a9(w)
t=w.length
if(!(v<t))return A.l(w,v)
w[v]=x>>>18|240
v=s.b=u+1
if(!(u<t))return A.l(w,u)
w[u]=x>>>12&63|128
u=s.b=v+1
if(!(v<t))return A.l(w,v)
w[v]=x>>>6&63|128
s.b=u+1
if(!(u<t))return A.l(w,u)
w[u]=x&63|128
return!0}else{s.b6()
return!1}},
ct(d,e,f){var x,w,v,u,t,s,r,q,p=this
if(e!==f){x=f-1
if(!(x>=0&&x<d.length))return A.l(d,x)
x=(d.charCodeAt(x)&64512)===55296}else x=!1
if(x)--f
for(x=p.c,w=x.$flags|0,v=x.length,u=d.length,t=e;t<f;++t){if(!(t<u))return A.l(d,t)
s=d.charCodeAt(t)
if(s<=127){r=p.b
if(r>=v)break
p.b=r+1
w&2&&A.a9(x)
x[r]=s}else{r=s&64512
if(r===55296){if(p.b+4>v)break
r=t+1
if(!(r<u))return A.l(d,r)
if(p.cU(s,d.charCodeAt(r)))t=r}else if(r===56320){if(p.b+3>v)break
p.b6()}else if(s<=2047){r=p.b
q=r+1
if(q>=v)break
p.b=q
w&2&&A.a9(x)
if(!(r<v))return A.l(x,r)
x[r]=s>>>6|192
p.b=q+1
x[q]=s&63|128}else{r=p.b
if(r+2>=v)break
q=p.b=r+1
w&2&&A.a9(x)
if(!(r<v))return A.l(x,r)
x[r]=s>>>12|224
r=p.b=q+1
if(!(q<v))return A.l(x,q)
x[q]=s>>>6&63|128
p.b=r+1
if(!(r<v))return A.l(x,r)
x[r]=s&63|128}}}return t}}
B.az.prototype={
aI(){return new B.cY()}}
B.cY.prototype={
cw(d){var x,w,v,u,t=this
A.e(d)
d.preventDefault()
switch(t.d){case"feature":x="Feature Request"
break
case"question":x="Question"
break
case"other":x="Other"
break
case"bug":default:x="Bug Report"
break}w=B.kg(2,"[Coinky Support] "+x,D.n,!1)
v=B.kg(2,t.e,D.n,!1)
A.e(A.e(b.G.window).location).href="mailto:coinky.dev@gmail.com?subject="+w+"&body="+v
u=A.A(d.target)
if(u!=null)u.reset()
t.X(new B.hn(t))},
t(a1){var x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i,h=this,g=null,f="form-group",e="form-label",d=a1.ai(y.z).d,a0=d==="pt"
if(a0)x="Fale Conosco"
else x=d==="es"?"Contacto":"Contact Us"
if(a0)w="Voltar para a p\xe1gina inicial"
else w=d==="es"?"Volver al inicio":"Back to home"
if(a0)v="Assunto / Categoria"
else v=d==="es"?"Asunto / Categor\xeda":"Subject / Category"
if(a0)u="Descreva a sua mensagem ou problema"
else u=d==="es"?"Describa su mensaje o problema":"Describe the issue or message"
if(a0)t="Enviar por E-mail"
else t=d==="es"?"Enviar por Correo":"Send via E-mail"
s=y.F
r=C.q(A.a([C.V(A.a([new A.b("\u2190 ",g),new A.b(w,g)],s),g,"back-link","#",new B.hp(),g),C.jh(A.a([new A.b(x,g)],s),"privacy-title")],s),"privacy-header")
q=y.w
p=y.a
o=A.L(["submit",h.gcv()],q,p)
n=B.kL(A.a([new A.b(v+" *",g)],s),e)
m=h.d
if(a0)l="Relato de Bug"
else l=d==="es"?"Reporte de Error":"Bug Report"
l=B.c0(A.a([new A.b(l,g)],s),"bug")
if(a0)k="Sugest\xe3o de Recurso"
else k=d==="es"?"Sugerencia de Funci\xf3n":"Feature Request"
k=B.c0(A.a([new A.b(k,g)],s),"feature")
if(a0)j="D\xfavida"
else j=d==="es"?"Consulta":"Question"
j=B.c0(A.a([new A.b(j,g)],s),"question")
if(a0)i="Outro"
else i=d==="es"?"Otro":"Other"
m=C.q(A.a([n,B.kR(A.a([l,k,j,B.c0(A.a([new A.b(i,g)],s),"other")],s),g,"form-control",new B.hq(h),m)],s),f)
i=B.kL(A.a([new A.b(u+" *",g)],s),e)
return C.c2(A.a([C.q(A.a([C.q(A.a([r,new B.eU("custom-contact-form",o,A.a([m,C.q(A.a([i,new B.f9("form-control form-textarea",A.L(["required","true","rows","6","placeholder",a0?"Escreva aqui...":"Type here..."],q,q),A.L(["input",new B.hr(h)],q,p),A.a([new A.b(h.e,g)],s),g)],s),f),C.q(A.a([B.kG(A.a([new A.b(t,g)],s),g,"btn btn-primary btn-lg",g,D.Q)],s),"form-actions")],s),g)],s),"privacy-card glass-card")],s),"container privacy-container")],s),"privacy-section","form")}}
B.bX.prototype={
t(d){var x=this,w=null,v=y.w,u=A.K(v,v),t=x.y
if(t!=null)u.v(0,t)
t=x.e==null?w:"submit"
if(t!=null)u.j(0,"type",t)
v=A.K(v,y.a)
v.v(0,C.io().$1$1$onClick(x.f,y.v))
return new A.x("button",w,x.w,w,u,v,x.Q,w)}}
B.fn.prototype={
Y(){return"ButtonType."+this.b}}
B.eU.prototype={
t(d){var x=y.w
return new A.x("form",null,this.z,null,A.K(x,x),this.at,this.ax,null)}}
B.eZ.prototype={
t(d){var x=null,w=y.w
return new A.x("label",x,this.e,x,A.K(w,w),x,this.x,x)}}
B.f2.prototype={
t(d){var x=null,w=y.w
w=A.K(w,w)
w.j(0,"value",this.d)
return new A.x("option",x,x,x,w,x,this.Q,x)}}
B.f7.prototype={
t(d){var x=this,w=null,v=y.w,u=A.K(v,v),t=x.ay
if(t!=null)u.v(0,t)
u.j(0,"value",x.d)
v=A.K(v,y.a)
v.v(0,C.io().$1$2$onChange$onInput(x.Q,w,y.B))
return new A.x("select",w,x.at,w,u,v,x.CW,w)}}
B.f9.prototype={
t(d){var x,w=this,v=null,u=y.w,t=A.K(u,u)
t.v(0,w.cy)
x=A.K(u,y.a)
x.v(0,w.db)
x.v(0,C.io().$1$2$onChange$onInput(v,v,u))
return new A.x("textarea",v,w.CW,v,t,x,w.dx,v)}}
B.ak.prototype={
L(){var x=this.aI(),w=($.P+1)%16777215
$.P=w
w=new B.e6(x,w,this,E.d)
x.c=w
x.sbA(this)
return w}}
B.X.prototype={
bd(){},
X(d){y.k.a(d).$0()
this.c.bg()},
sbA(d){A.k(this).h("X.T?").a(d)}}
B.e6.prototype={
aH(){return this.ry.t(this)},
H(){var x=this
if(x.w.c)x.ry.toString
x.cz()
x.aR()},
cz(){try{this.ry.bd()}finally{}this.ry.toString},
ab(){var x=this
x.w.toString
if(x.x1){x.ry.toString
x.x1=!1}x.bp()},
ad(d){var x
y.g.a(d)
x=this.ry
x.toString
A.k(x).h("X.T").a(d)
return!0},
N(d){y.g.a(d)
this.aU(d)
this.ry.sbA(d)},
a7(d){var x
y.g.a(d)
try{x=this.ry
x.toString
A.k(x).h("X.T").a(d)}finally{}this.ar(d)},
a6(){this.ry.toString
this.ca()},
an(){this.aT()
this.ry=this.ry.c=null},
aJ(){this.bq()
this.x1=!0}}
var z=a.updateTypes(["~(p)"])
B.hn.prototype={
$0(){var x=this.a
x.d="bug"
x.e=""},
$S:0}
B.hp.prototype={
$0(){A.e(A.e(b.G.window).location).hash=""},
$S:0}
B.hq.prototype={
$1(d){var x
y.B.a(d)
if(J.jx(d)){x=this.a
x.X(new B.ho(x,d))}},
$S:6}
B.ho.prototype={
$0(){return this.a.d=J.iE(this.b)},
$S:0}
B.hr.prototype={
$1(d){var x=A.A(A.e(d).target)
if(x==null)x=A.e(x)
this.a.e=A.u(x.value)},
$S:3};(function aliases(){var x=B.X.prototype
x.cg=x.bd})();(function installTearOffs(){var x=a._instance_1u
x(B.cY.prototype,"gcv","cw",0)})();(function inheritance(){var x=a.inherit,w=a.inheritMany
x(B.dC,A.ba)
x(B.eg,B.dC)
x(B.h9,A.ch)
w(A.m,[B.hO,B.X])
x(B.ak,A.f)
x(B.az,B.ak)
x(B.cY,B.X)
w(A.aT,[B.hn,B.hp,B.ho])
w(A.ap,[B.hq,B.hr])
w(C.r,[B.bX,B.eU,B.eZ,B.f2,B.f7,B.f9])
x(B.fn,A.bl)
x(B.e6,A.aS)})()
A.eM(b.typeUniverse,JSON.parse('{"dC":{"ba":["c","n<d>"]},"eg":{"ba":["c","n<d>"]},"az":{"ak":[],"f":[]},"cY":{"X":["az"],"X.T":"az"},"bX":{"r":[],"f":[]},"eU":{"r":[],"f":[]},"eZ":{"r":[],"f":[]},"f2":{"r":[],"f":[]},"f7":{"r":[],"f":[]},"f9":{"r":[],"f":[]},"ak":{"f":[]},"e6":{"h":[],"U":[]}}'))
var y={z:A.H("aX"),F:A.H("t<f>"),B:A.H("n<c>"),g:A.H("ak"),w:A.H("c"),v:A.H("~"),k:A.H("~()"),a:A.H("~(p)")};(function constants(){D.Q=new B.fn(0,"submit")
D.n=new B.eg()
D.X=new B.h9()})();(function lazyInitializers(){var x=a.lazyFinal
x($,"oo","l4",()=>A.fZ("^[\\-\\.0-9A-Z_a-z~]*$"))})()};
(a=>{a["gvVpAKuigokjva3Bg1wYGw4tszI="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.client.dart.js_2.part.js.map
