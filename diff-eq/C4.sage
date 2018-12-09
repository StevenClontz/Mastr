t = var("t")
y = function("y")(t)

# pick a,b for (D-a)(D-b)
a = randrange(1,6)*choice([-1,1])
b=a
while a==b:
  b = randrange(1,6)*choice([-1,1])
# pick particular solution
k1 = randrange(0,6)*choice([-1,1])
k2 = randrange(-5,6)
y = k1*exp(a*t)+k2*exp(b*t)


print("ODE:")
def display_coeff(x):
  if x==1:
    return "+"
  return ("+" if x > -1 else "") + str(x)
print(
  "y''" +
  display_coeff(-a-b) +
  "y'" +
  display_coeff(a*b) +
  "y = 0 \hspace{1em} y(0) = " +
  latex(y(t=0)) +
  ", y'(0) =" +
  latex(y.diff()(t=0))
)
print
print("Solution:")
print("y="+latex(y))

#import json
#print(json.dumps({"x":str(factor(x)),"z":"3"}))
