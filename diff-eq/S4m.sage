class S4m(MastrExercise):
  @classmethod
  def title(self):
    return "S4m: Interacting populations" 

  def generate(self):
    '''
    We focus on three scenarios: isoclines cross in 1st quadrant,
    isoclines cross on an axis, or isoclines cross outside 1st quadrant.
    '''
    scale=choice([5,10,15,20])
    scenario = randrange(0,1)
    x_fish = choice([
      {"name":"bluegill","var":"B"},
      {"name":"redfish","var":"R"},
      {"name":"greenfish","var":"G"},
      {"name":"purplegill","var":"P"},
      {"name":"yellowgill","var":"Y"},
      {"name":"magentafish","var":"M"},
    ])
    y_fish = x_fish
    while y_fish == x_fish:
      y_fish = choice([
        {"name":"bluegill","var":"B"},
        {"name":"redfish","var":"R"},
        {"name":"greenfish","var":"G"},
        {"name":"purplegill","var":"P"},
        {"name":"yellowgill","var":"Y"},
        {"name":"magentafish","var":"M"},
      ])
    x = var(x_fish["var"])
    y = var(y_fish["var"])
    if scenario == 0:
      intersection=choice([[2,5],[3,4],[5,6]])
      if intersection==[2,5]:
        isocline_xin = scale*(40-10*x-4*y)
        isocline_xout = scale*(50-5*x-12*y)
      if intersection==[3,4]:
        isocline_xin = scale*(50-10*x-5*y)
        isocline_xout = scale*(54-6*x-9*y)
      if intersection==[5,6]:
        isocline_xin = scale*(120-12*x-10*y)
        isocline_xout = scale*(160-8*x-20*y)
   
    return { 
      "m_1": latex(isocline_xin),
      "m_2": latex(isocline_xout),
    }
