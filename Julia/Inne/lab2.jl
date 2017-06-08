function myfunc(n)
    for i = 1:n
        A=rand(100, 300, 200)
        maximum(A)
    end
end

Profile.clear()
@profile myfunc(10)

using ProfileView
ProfileView.view()
