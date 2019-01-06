function love.conf(t)--Функция которую вызывает love перед стартом приложения
    io.stdout:setvbuf("no")--Из-за особенностей Sublime Text, точнее его консольки нужно вызывать эту функцию, 
                           --иначе все что мы выводим с помощью print(str) бкдет выведено после закрытия игры.
    t.title = "Snake is so awesome!"
end