class S2m(MastrExercise):
  @classmethod
  def title(self):
    return "S2m: Coupled mass-spring systems" 

  def generate(self):
    '''
    The system 
    m_1x_1''=-(k_1+k_2)x_1+k_2x_2
    m_2x_2''=k_2x_1-k_2x_2
    has solutions e^(+-isqrt(a)t) and e^(+-isqrt(b)t) when both
    m_1m_2(a+b)=(k_1+k_2)m_2+k_2m_1
    m_1m_2ab=k_1k_2
    are satisfied. We will choose nice scenarios
    to guarantee these.
    '''
    # mmkkab is a list of m_1,m_2,k_1,k_2,a,b
    mmkkabs=[
      [1,1,3,2,1,6],
      [1,1,15,4,3,20],
      [1,1,5,6,2,15],
      [1,2,5,4,1,10],
      [1,2,4,6,1,12],
      [1,2,14,6,2,21],
      [2,1,4,2,1,4],
      [2,1,18,4,3,12],
      [2,1,10,12,3,20]
    ]
    shuffle(mmkkabs)
    mmkkab=mmkkabs[0]
    c_1 = randrange(2,6)*choice([-1,1]) 
    c_2 = randrange(2,6)*choice([-1,1]) 
    t = var("t")
    x_1 = c_1*cos(sqrt(mmkkab[4])*t)+c_2*cos(sqrt(mmkkab[5])*t)
    x_2 = (mmkkab[0]*x_1.diff(t).diff(t)+(mmkkab[2]+mmkkab[3])*x_1)/mmkkab[3]
    x_1_init = x_1(t=0)
    if x_1_init < 0:
      outin1 = "inwards"
    else:
      outin1 = "outwards"
    x_2_init = x_2(t=0)
    if x_2_init < 0:
      outin2 = "inwards"
    else:
      outin2 = "outwards"
    ivp_1 = latex(mmkkab[0])+"x_1''=-"+latex(mmkkab[2]+mmkkab[3])+\
      "x_1+"+latex(mmkkab[3])+"x_2\\hspace{2em}x_1(0)="+latex(x_1_init)+",x_1'(0)=0"
    ivp_2 = latex(mmkkab[1])+"x_2''="+latex(mmkkab[3])+\
      "x_1+"+latex(mmkkab[3])+"x_2\\hspace{2em}x_2(0)="+latex(x_2_init)+",x_2'(0)=0"
    elapsed_t = randrange(2,6)
    elapsed_x_1 = x_1(t=elapsed_t)
    elapsed_x_2 = x_2(t=elapsed_t)
   
    return { 
      "m_1": latex(mmkkab[0]), 
      "m_2": latex(mmkkab[1]), 
      "k_1": latex(mmkkab[2]), 
      "k_2": latex(mmkkab[3]), 
      "ivp_1": ivp_1, 
      "ivp_2": ivp_2, 
      "x_1": "x_1="+latex(x_1), 
      "x_2": "x_2="+latex(x_2), 
      "x_1_init": latex(x_1_init.abs()), 
      "x_2_init": latex(x_2_init.abs()), 
      "outin1": outin1,
      "outin2": outin2,
      "elapsed_t": latex(elapsed_t),
      "elapsed_x_1": latex(elapsed_x_1.n(digits=3)),
      "elapsed_x_2": latex(elapsed_x_2.n(digits=3)),
    }
