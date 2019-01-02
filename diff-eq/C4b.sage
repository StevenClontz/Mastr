class C3b(MastrExercise):
  def title(self):
    return "C3 - Homogeneous second-order linear ODE"
  def generate(self):
    t = var("t")
    
    # pick a,b for (D-a)^2y+b^2=y''-2ay'+a^2+b^2
    a = randrange(1,6)*choice([-1,1])
    b = randrange(1,6)
    
    c1 = var("c_1")
    c2 = var("c_2")
    k1 = var("k_1")
    k2 = var("k_2")
    
    return {
      "ode": 
        "y''" +
        display_coeff(-2*a) +
        "y'" +
        display_coeff(a^2+b^2) +
        "y = 0",
      "complex_ode_sol": 
        "y="+latex(c1*exp((a+b*i)*t)+c2*exp((a-b*i)*t)),
      "ode_sol": 
        "y="+latex(exp(a*t)*(k1*cos(b*t)+k2*sin(b*t)))
    }
    
