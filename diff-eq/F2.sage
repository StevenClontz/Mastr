t = var("t")

# pick n for y=kx^n
n = randrange(2,4)*choice([-1,1])
# pick initial value
t0 = randrange(1,5)*choice([-1,1])
# pick coefficient
k = randrange(1,5)*choice([-1,1])
y = k*t^n

print("ODE:")
print(
  "xy'=" +
  latex(n) +
  "y \hspace{1em} y(" +
  latex(t0) +
  ") = " +
  latex(y(t=t0))
)
print
print("Solution:")
print("y="+ latex(k) +"t^"+latex(n))

#import json
#print(json.dumps({"x":str(factor(x)),"z":"3"}))
