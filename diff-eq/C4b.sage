t = var("t")
y = function("y")(t)

# pick a for D^2+a^2
a = randrange(2,5)
# pick particular solution
k1 = randrange(0,6)*choice([-1,1])
k2 = randrange(-5,6)
y = k1*sin(a*t)+k2*cos(a*t)


print("ODE:")
def display_coeff(x):
  if x==1:
    return "+"
  return ("+" if x > -1 else "") + str(x)
print(
  "y''" +
  display_coeff(a^2) +
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
