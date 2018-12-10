t = var("t")

# pick p(t) for y=e^p(t)
p = choice([
  randrange(1,4)*choice([-1,1])*t^2+randrange(-3,4)*t+randrange(-5,6),
  randrange(1,4)*choice([-1,1])*cos(t),
  randrange(1,4)*choice([-1,1])*sin(t)
])
# pick coefficient
k = randrange(1,5)*choice([-1,1])
y = k*exp(p)

print("ODE:")
print(
  "y'=(" +
  latex(p.diff()) +
  ")y\hspace{1em} y(0)=" +
  latex(y(t=0))
)
print
print("Solution:")
print("y="+ latex(y))

#import json
#print(json.dumps({"x":str(factor(x)),"z":"3"}))
