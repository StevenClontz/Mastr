class C6(MastrExercise):
  @classmethod
  def title(self):
    return "C6 - Non-homogeneous second-order linear ODEs"

  def generate(self):
    t = var("t")
    
    # pick a,b for (D-a)(D-b)
    a = randrange(1,6)*choice([-1,1])
    b=a
    while a==b:
      b = randrange(1,6)*choice([-1,1])
    # pick particular solution
    c=a
    while c in [a,b]:
      c = randrange(1,6)*choice([-1,1])
    d = randrange(1,6)*choice([-1,1])
    ypart = choice([
      d*exp(c*t)
    ])
    k1 = var("k_1")
    k2 = var("k_2")
    y = k1*exp(a*t)+k2*exp(b*t)
    
    return {
      "ode":
        "y''" +
        display_coeff(-a-b) +
        "y'" +
        display_coeff(a*b) +
        "y = " +
        latex(ypart.diff().diff()+(-a-b)*ypart.diff()+a*b*ypart),
      "ode_sol":
        "y="+latex(y+ypart)
    }
