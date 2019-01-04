class C1(MastrExercise):
  @classmethod
  def title(cls):
    return "C1 - Homogeneous first-order linear ODE"

  def generate(self):
    t = var("t")
    y = function("y")(t)
    
    # pick a for y'-ay
    a = randrange(1,10)*choice([-1,1])

    k = var('k')   
 
    return {
      "ode": "y'"+display_coeff(-a)+"y=0",
      "ode_sol": "y="+latex(k*exp(a*t))
    }
