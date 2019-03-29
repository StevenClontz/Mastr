class D1(MastrExercise):
  @classmethod
  def title(cls):
    return "D1 - Laplace transform. Compute the Laplace transform of a function from the definition."

  def generate(self):
    """
    Generates one of the following:
    kt^b
    ksin(bt)
    kcos(bt)
    ke^{bt}+m*\delta(t-a)
    ke^{bt}+m*u(t-a)
    """
    t = var("t")
    s = var("s")
    d = function("delta",latex_name="\\delta")
    u = function("u")
    k = choice([-1,1])*randrange(1,5)
    l = choice([-1,1])*randrange(1,5)
    a = randrange(1,4)
    b = randrange(1,4)
    transform = choice([
      [k*t^b,k*factorial(b)/s^(b+1)],
      [k*sin(b*t),k*b/(s^2+b^2)],
      [k*cos(b*t),k*s/(s^2+b^2)],
      [k*exp(b*t)+l*d(t-a),k/(s-b)+l*exp(-a*s)],
      [k*exp(b*t)+l*u(t-a),k/(s-b)+l*exp(-a*s)/s],
    ])
 
    return {
      "transform": "\\mathcal L\\left\\{"+latex(transform[0])+\
        "\\right\\}="+latex(transform[1])
    }
