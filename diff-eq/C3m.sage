class C3m(MastrExercise):
  @classmethod
  def title(cls):
    return "C3m - Model and analyze the vertical motion of an object with linear drag" 

  def generate(self):
    term_speed = (randrange(101,999)/1000) # in m/s
    drag_coeff = 0.7
    atmo_density = 1.22665
    grav_accel = 9.8
    radius = (drag_coeff*atmo_density*term_speed^2/(200*grav_accel)) 
    mass = (100*pi*radius^3)
    coefficient = (grav_accel/term_speed) # the a in v'+av=-g
    elapsed_time = (randrange(2,5)/100) # in s
    elapsed_velocity = (
      grav_accel*exp(-coefficient*elapsed_time)/coefficient-grav_accel/coefficient
      )
 
    return {
      "radius": latex(radius.n(digits=2)),
      "mass": latex(mass.n(digits=2)),
      "term_speed": latex(term_speed.n(digits=3)),
      "coefficient": latex(coefficient.n(digits=3)),
      "elapsed_time": "0.0"+(elapsed_time*100).str(),
      "elapsed_velocity": latex(elapsed_velocity.n(digits=2))
    }
