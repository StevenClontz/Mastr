t = var("t")
y = function("y")(t)

# pick a for y'-ay
a = randrange(1,6)*choice([-1,1])

# particular solution
b=a
while (b==a):
  b = randrange(1,6)*choice([-1,1])
c = choice([-3,-2,2,3])
part_sol = choice([
########  b,
  c*exp(b*t),
  c*exp(a*t)*t,
  c*exp(a*t)*sin(b*t),
  c*exp(a*t)*cos(b*t)
])

print("ODE:")
def display_coeff(x):
  if x==1:
    return "+"
  return ("+" if x > -1 else "") + str(x)
print(
  "y'" +
  display_coeff(-a) +
  "y =" +
  latex(part_sol.diff()-a*part_sol) 
)
print
print("Solution:")
k = var("k")
print(latex(y==k*exp(a*t)+part_sol))

#import json
#print(json.dumps({"x":str(factor(x)),"z":"3"}))
