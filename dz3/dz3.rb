# 1. Что выведет этот код? Почему перменная @message доступна в методе make_some_voice()

class Geek
  def initialize
    @message = "ruby ruby"
  end

  def make_some_voice
    "I like to #{@message}"
  end
end

alex = Geek.new
puts alex.make_some_voice()

# "I like to ruby ruby"
# @message - переменная экземпляра класса

# 2. Что этот код напечатает в STDOUT? Поясните.
class Computer
  def initialize
    @sound = "beep beep"
  end

  def self.about
    "Sometimes I go #{@sound}"
  end
end

p Computer.about

# "Sometimes I go "
# self.about - метод самого класса (не экземпляра),
# т.к. экземпляр этого класса не создавался, следовательно переменная экземпляра @sound пустая

# 3. Что этот код напечатает в STDOUT?

class Xyz
  def pots
    @nice
  end
end

xyz = Xyz.new
p xyz.pots

#nil

# 4. Что этот код напечатает в STDOUT?

class Xyz
  def paper
    unassigned_local_variable
  end
end

xyz = Xyz.new
p xyz.paper

# error unassigned_local_variable

# 5. Что этот код напечатает в STDOUT? Поясните что произойдет метод meaning_of_life()
# вызвать несколько раз для одного объекта.

class Something
  def meaning_of_life
    @result ||= result
    "The meaning of life is the number #{@result}"
  end

  def result
    Math.log10(100) * 42 - 48 - 13
  end
end

something = Something.new
p something.meaning_of_life

# "The meaning of life is the number 23.0"
# @result ||= result - берёт значение @result если она не nil
# без разницы сколько раз вызывать

# 6. Что этот код напечатает в STDOUT? Поясните.

class Cup
  PURPOSE = "hold liquids"
  def main_use
    PURPOSE
  end
end

tea_cup = Cup.new
p tea_cup.main_use

# напечатает константу PURPOSE

# 7. Что этот код напечатает в STDOUT? Поясните.

class Chair
  AGE = "been around the block"
  def self.about
    "I'm old and I've #{AGE}"
  end
end

p Chair.about

# "I'm old and I've been around the block"
# константа AGE определяется в момент описания класса, а не создания экземпляра

# 8. Что этот код напечатает в STDOUT? Поясните.

BEST_MOVIE = "Viking"
BEST_MOVIE = "Matilda"
p BEST_MOVIE

# "Matilda"

# 9. Что этот код напечатает в STDOUT? Поясните.

class Bottle
  DRANK = "lemme hit that"
end

p Bottle::DRANK

# "lemme hit that"
# DRANK - константа класса

# 10. Поясните следующее утвреждение: "В руби все есть объект, так что нет не"
Explain the following statement: "Все в Ruby является объектом, так что нет никаких автономных функций в Ruby,
все функции на самом деле методы".

# это очевидно, ведь всё есть объект ))

# 11. Поясните почему метод Pig#main_desire может обращаться к методу weight() без префикс self.

class Pig
  def weight()
    "100 kg"
  end

  def main_desire()
    "eat all day and be more than #{weight()}"
  end
end

piggy = Pig.new()
piggy.main_desire()

# потому что weight находится в области видимости класса Pig

# 12. Поясните вызовв метода через Fan.about и почему декларация метода about() использует
# зарезервированное слово self.

class Fan
  def self.about
    "my job is to keep people cool"
  end
end

p Fan.about

# about определяется в момент описания класса

# 13. Что этот код напечатает в STDOUT? Поясните.

class Woman
  SELF = self
end

p Woman::SELF

# Woman
# свой класс

# 14. Что этот код напечатает в STDOUT? Поясните.

class Dude
end

def Dude.motto
  "Cowabunga"
end

p Dude.motto

# class Dude
# end
# error

# 15. Что этот код напечатает в STDOUT? Поясните.

class Phone
  def Phone.job
    "Distract you from life"
  end
end

p Phone.job

# def Phone.job <=> def self.job

# 16. Что этот код напечатает в STDOUT? Поясните.

def blah
  "blah blah"
end

class Geek
  def make_some_voice
    "I am #{blah}"
  end
end

p Geek.new.make_some_voice

# def blah - в области видимости

# 17. Укажите кто тут объект, кто сообщение, что метод и кто получатель сообщения:

x = 5.to_f

# 5 - объект
# to_f - метод
# = - метод
# "#{5.to_f}" - сообщение
# x - получатель сообщения

# 18. Поясните как сообщение (значение) отправляется, кто тут получатель (метод), и каково содержание сообщения.
"table".upcase()

# не понял вопроса

# 19. Укажите на сообщение (значение) и получателя (метод).

class Calculator
  def add(x, y)
    x + y
  end
end

my_calculator = Calculator.new
my_calculator.send(:add, 3, 4)

# send - получатель
# :add, 3, 4 - сообщение

# 20. Укажите на сообщения (значения) и получателя (метод).

3 + 4

# 4 - сообщениe
# + - метод

# 21. Укажите отправителя, получателя, и само сообщение когда мы дернем метод Circle#area.

class Circle
  def area(radius)
    calc = Calculator.new
    calc.pi * radius ** 2
  end
end

class Calculator
  def pi
    3.14
  end
end

my_circle = Circle.new
p my_circle.area(3)

# 3 - сообщение
# area - получатель (метод)
