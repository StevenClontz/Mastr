class C4b(MastrExercise):
  def title(self):
    return "C4 - Homogeneous second-order linear IVP"
  def generate(self):
    t = var("t")
    y = function("y")(t)
    
    # pick a for D^2+a^2
    a = randrange(2,5)
    # pick particular solution
    k1 = randrange(-5,6)
    k2 = k1
    while k2==k1:
      k2 = randrange(-5,6)
    y = k1*sin(a*t)+k2*cos(a*t)
    
    return {
      "ivp":
        "y''" +
        display_coeff(a^2) +
        "y = 0 \hspace{1em} y(0) = " +
        latex(y(t=0)) +
        ", y'(0) =" +
        latex(y.diff()(t=0)),
      "ivp_sol":
        "y="+latex(y)
    }
