class C5(MastrExercise):
  @classmethod
  def title(self):
    return "C5 - Homogeneous second-order linear IVP"

  def generate(self):
    t = var("t")
    
    # pick a,b for (D-a)(D-b)
    a = randrange(1,6)*choice([-1,1])
    b=a
    while a==b:
      b = randrange(1,6)*choice([-1,1])
    # pick particular solution
    k1 = randrange(-5,6)
    k2 = k1
    while k2==k1:
      k2 = randrange(-5,6)
    y = k1*exp(a*t)+k2*exp(b*t)
    
    return {
      "ivp":
        "y''" +
        display_coeff(-a-b) +
        "y'" +
        display_coeff(a*b) +
        "y = 0 \hspace{1em} y(0) = " +
        latex(y(t=0)) +
        ", y'(0) =" +
        latex(y.diff()(t=0)),
      "ivp_sol":
        "y="+latex(y)
    }
