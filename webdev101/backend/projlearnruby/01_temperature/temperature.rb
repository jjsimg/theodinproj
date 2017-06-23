#write your code here
def ftoc(temp)
	temp=Float(temp)
	temp=(temp-Float(32))*Float(5)/Float(9)
	Integer(temp)==temp ? temp=Integer(temp) : temp=Float("%.1f" % temp)
end

def ctof(temp)
	temp=Float(temp)
	temp=temp*(Float(9)/Float(5))+32
	Integer(temp)==temp ? temp=Integer(temp) : temp=Float("%.1f" % temp)
end
