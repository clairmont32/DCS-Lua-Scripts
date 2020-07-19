function dothis()
print("hello world")
end

sched = SCHEDULER:New(nil, dothis(), nil, 5, 30, 60 )