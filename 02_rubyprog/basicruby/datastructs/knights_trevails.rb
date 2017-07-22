def knight_moves(start_pos, end_pos)
  # return if start_pos == location

  # knight_moves(start_pos, end_pos)


  traverse(start_pos)
end

def traverse(pos)
  pos0 = pos.clone
  pos0[0] += -1
  pos0[1] += 2
  print "[#{pos0[0]}, #{pos0[1]}], 2 up 1 left\n"

  pos1 = pos.clone
  pos1[0] += 1
  pos1[1] += 2
  print "[#{pos1[0]}, #{pos1[1]}], 2 up 1 right\n"

  pos2 = pos.clone
  pos2[0] += -2
  pos2[1] += 1
  print "[#{pos2[0]}, #{pos2[1]}], 1 up 2 left\n"

  pos3 = pos.clone
  pos3[0] += 2
  pos3[1] += 1
  print "[#{pos3[0]}, #{pos3[1]}], 1 up 2 right\n"

  pos4 = pos.clone
  pos4[0] += -2
  pos4[1] += -1
  print "[#{pos4[0]}, #{pos4[1]}], 1 down 2 left\n"

  pos5 = pos.clone
  pos5[0] += 2
  pos5[1] += -1
  print "[#{pos5[0]}, #{pos5[1]}], 1 down 2 right\n"

  pos6 = pos.clone
  pos6[0] += -1
  pos6[1] += -2
  print "[#{pos6[0]}, #{pos6[1]}], 2 down 1 left\n"

  pos7 = pos.clone
  pos7[0] += 1
  pos7[1] += -2
  print "[#{pos7[0]}, #{pos7[1]}], 2 down 1 right\n"
end

knight_moves([1,2],[3,1])