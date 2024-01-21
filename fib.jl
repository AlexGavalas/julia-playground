answer = 42
println(2answer)

calc = begin
    ret = 12
    2ret / 3
end
println(calc)

IntOrString = Union{Int,String}

mutable struct doc
    name::IntOrString
    id::Int32
end

d = doc("a name", 1)

println(d.name)
d.name = "a new name"
println(d.name)
d.name = 1
println(d.name)

array = [1, 2, 3, 4]
println(array[2:3])

mat = [11 22 33; 4 5 6]
println(mat[2, 1])

table = zeros(2, 3, 4)
println(table)

tupl = (1, 2, 3)
println(tupl)

ntupl = (a=1, b=(a=42, b=22), c=3)
println(ntupl)
println(ntupl[2].a)

dict = Dict(
    "a" => "1adasd"
)
println(dict["a"])

multi = cat([1 2; 3 4], [pi, pi], fill(10, 2, 3); dims=2)
println(multi)

for num ∈ 1:5
    println(num)
end

counter = 0
while counter < 5
    println(counter)
    global counter += 1
end

try
    println("Try")
    sqrt("KLALDKJ")
    println("Should not log")
catch e
    println("Caught")
    if e isa DivideError
        println(e)
    end
finally
    println("Finally")
end

function fibonacci(n::Int)
    if n < 0
        error("n must not be negative")
    end

    if n === 1 || n === 0
        return 1
    end

    fibonacci(n - 1) + fibonacci(n - 2)
end

println(fibonacci(10))

fib(n::Int) = n <= 1 ? 1 : fib(n - 1) + fib(n - 2)

println(fib(10))

fib_lambda = (n::Int) -> Int
fib_lambda = (n) -> n <= 1 ? 1 : fib_lambda(n - 1) + fib_lambda(n - 2)

println(fib_lambda(10))

println(map(x -> 2x, [1, 2, 3, 4]))

result = map([1, 2, 3, 4]) do x
    2x + 3
end

println(result)

named_func = (; x, y) -> x + y

println(named_func(y=1, x=2))

function sum(a, b)
    println("Generic add")
    a + b
end

function sum(a::Float64, b::Float64)
    println("Float add")
    a + b
end

sum(1, 2)
sum(1.0, 2.2)

composed = (println ∘ sqrt ∘ +)

composed(1, 1, 5)

piped = x -> (x |> uppercase |> println)

piped("abc")

function shout(s::String)
    println(uppercase(s))
end

shout.(["hey", "abc"])

include("helpers.jl")

import Main.Helpers
println(Main.Helpers.toUppercase("abc"))
println(Helpers.toUppercase("abc"))
# println(toUppercase("abc"))

using .Helpers
println(Main.Helpers.toUppercase("abc"))
println(Helpers.toUppercase("abc"))
# println(toUppercase("abc"))

println(pwd())

using Dates
println(now())
