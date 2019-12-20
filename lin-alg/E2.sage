class E2(MastrExercise):
  @classmethod
  def title(self):
    return "E2 - Row Reduction"

  def generate(self):
    # create a 3x5,4x4,5x3 matrix
    rows = randrange(3,6)
    columns = 8-rows

#    #Pick cols vectors of dimension rows
#    column_vectors = []
#    for _ in range(0,columns):
#      vector_array = []
#      for _ in range(0,rows):
#        vector_array.append(randrange(-6,7))
#      column_vectors.append(vector(vector_array))
#
#    #Randomly redefine the 2nd, 3rd, or 4th columns to be
#    #forced to be linear combinations of previous columns
#    if columns>3 and choice([True,False]):
#      column_vectors[1] = choice([-1,1])*randrange(1,5)*column_vectors[0]
#    if choice([True,False]):
#      column_vectors[2] = randrange(-4,5)*column_vectors[0]+randrange(-4,5)*column_vectors[1]
#    #Ensure 4th and 5th columns are clean linear combination of previous columns
#    if columns>3:
#      column_vectors[3] = randrange(-4,5)*column_vectors[0]+randrange(-4,5)*column_vectors[1]+randrange(-4,5)*column_vectors[2]
#    if columns>4:
#      column_vectors[4] = randrange(-4,5)*column_vectors[1]+randrange(-4,5)*column_vectors[2]
#
#    #Create matrix from columns
#    A = column_matrix(column_vectors)

    #start with nice RREF
    max_number_of_pivots = min(rows,columns)
    number_of_pivots = randrange(2,max_number_of_pivots+1)
    rrefA = random_matrix(QQ,rows,columns, algorithm="echelon_form", num_pivots=number_of_pivots)
    A = rrefA

    #perform row operations to undo
    A.add_multiple_of_row(1,0,choice([-1,1]))
    if rows > 3:
      A.add_multiple_of_row(3,2,choice([-1,1])*randrange(1,3))
    if rows > 4:
      A.add_multiple_of_row(4,1,choice([-1,1])*randrange(1,3))
    operations = ['swap','scale','add','swap','scale','add']
    shuffle(operations)
    for operation in operations:
      if operation == 'swap':
        swap1 = randrange(1,rows)
        swap2 = randrange(0,swap1)
        A.swap_rows(swap1,swap2)
      if operation == 'scale':
        scale = choice([-1,1])*randrange(2,4)
        row = randrange(0,rows)
        A.rescale_row(row,scale)
      if operation == 'add':
        add_from = randrange(1,rows)
        add_to = randrange(0,add_from)
        if choice([True,False]):
          add_from,add_to = add_to,add_from
        scale = choice([-1,1])*randrange(1,4)
        A.add_multiple_of_row(add_to,add_from,scale)
      
    
    latex.matrix_delimiters("[", "]")    
    return {
      "a": latex(A),
      "rref": latex(A.rref()),
    }
