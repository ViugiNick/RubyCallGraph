class A
  def foo1(a)
    foo2(1, a)
  end

  def foo2(a, b)
    puts a + b
  end
end

TracePoint.new(:call) do |tp|
  puts "method: #{tp.method_id}(#{tp.path}:#{tp.lineno})"
  puts "-->#{caller[1]}"
end.enable do
  A.new.foo1 2
end