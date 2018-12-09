t = var("t")
y = function("y")(t)

# pick a,b for (D-a)^2y+b^2=y''-2ay'+a^2+b^2
a = randrange(1,6)*choice([-1,1])
b = randrange(1,6)


print("ODE:")
def display_coeff(x):
  if x==1:
    return "+"
  return ("+" if x > -1 else "") + str(x)
print(
  "y''" +
  display_coeff(-2*a) +
  "y'" +
  display_coeff(a^2+b^2) +
  "y = 0"
)
print
print("Solution:")
k1 = var("k_1")
k2 = var("k_2")
print("y="+latex(exp(a*t)*(k1*cos(b*t)+k2*sin(b*t))))

#import json
#print(json.dumps({"x":str(factor(x)),"z":"3"}))
