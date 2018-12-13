class C3(MastrExercise):
  def generate(self):
    t = var("t")
    y = function("y")(t)
    
    # pick a for (D-a)^2
    a = randrange(1,6)*choice([-1,1])
    
    k1 = var("k_1")
    k2 = var("k_2")
    
    return {
      "ode": 
        "y''" +
        display_coeff(-2*a) +
        "y'" +
        display_coeff(a^2) +
        "y = 0",
      "solution": "y="+latex(k2*exp(a*t)+k1*t*exp(a*t))
    }
