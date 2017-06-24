#write your code here
def add(num1,num2)
	ans=num1+num2
end

def subtract(num1,num2)
	ans=num1-num2
end

def sum(arr)
	ans=arr.inject(0) {|sum,x| sum+x}
end

def multiply(arr)
	ans=arr.inject(1) {|prod,x| prod*x}
end

def power(num,pow)
	ans=num**pow
end

def factorial(num)
	(1..num).inject(:*) || 1
end