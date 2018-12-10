t = var("t")

# pick sine or cosine
a = randrange(1,4)
trig,t0 = choice([
  (cos(a*t),0),
  (sin(a*t),pi/(2*a))
])
# pick coefficient
k = randrange(1,5)*choice([-1,1])
y = k*trig

print("ODE:")
print(
  latex(trig.diff())+
  "y=" +
  latex(trig()) +
  "y'\hspace{1em} y\left("+
  latex(t0)+
  "\\right)=" +
  latex(y(t=t0))
)
print
print("Solution:")
print("y="+ latex(y))

#import json
#print(json.dumps({"x":str(factor(x)),"z":"3"}))
