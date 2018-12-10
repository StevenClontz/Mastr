t = var("t")

# pick a,b for x'=k*t^p(t-a)(t-b)
k = choice([-1,1])
p = randrange(4)
a = randrange(-6,-1)
b = randrange(2,7)
f = k*t^p*(t-a)*(t-b)
if f(t=a-1)>0:
  a_label = "sink/stable"
else:
  a_label = "source/unstable"
if f(t=b+1)<0:
  b_label = "sink/stable"
else:
  b_label = "source/unstable"
if p in [0,2]:
  z_label = "neither/unstable"
elif f(t=1)<0:
  z_label = "sink/stable"
else:
  z_label = "source/unstable"
# pick initial value
if randrange(2) == 0:
  t0 = randrange(a+1,0)+choice([-0.2,-0.1,0.1,0.2])
  x0 = randrange(1,b)+choice([-0.2,-0.1,0.1,0.2])
  if f(t=t0)>0:
    lim = b
  elif p!=0:
    lim = 0
  else:
    lim = a
else:
  x0 = randrange(a+1,0)+choice([-0.2,-0.1,0.1,0.2])
  t0 = randrange(1,b)+choice([-0.2,-0.1,0.1,0.2])
  if f(t=t0)<0:
    lim = a
  elif p!=0:
    lim = 0
  else:
    lim = b

print("Autonomous ODE:")
x = var("x")
print(
  "x'=" +
  latex((k*x^p*(x-a)*(x-b)).expand()) 
)
print
print("Initial condition:")
x = var("x")
print(
  "x("+latex(t0.n(digits=1))+")="+latex(x0.n(digits=1))
)
print
print("Solution:")
print(latex(a) + "is a " + a_label)
if p!=0:
  print(latex(0) + "is a " + z_label)
print(latex(b) + "is a " + b_label)
print("\\lim_{t\\to\\infty}x(t)="+latex(lim))

#import json
#print(json.dumps({"x":str(factor(x)),"z":"3"}))
