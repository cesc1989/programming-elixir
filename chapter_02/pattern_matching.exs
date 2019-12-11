# A pattern(the left side) is matched if the values(the right side) have the same structure
# and if each term in the pattern can be matched to the corresponding term in the values.

texto = [ "hola", "mundo", "cruel" ]
[ a, b, c ] = texto

IO.puts a
IO.puts b
IO.puts c

#
#

lista = [1, 2, [4, 5, 6]]
[d, e, f] = lista

IO.puts d
IO.puts e
IO.puts f

# The literal 2 in the pattern matched the corresponding term on the right,
# so the match succeeds by setting the values of `aa` and `bb` to `1` and `3`

error = [1, 2, 3]
[aa, 2, bb] = error

IO.puts aa
IO.puts bb

# The `1`(second term in the list) cannot be matched against the corresponding element on the right side,
# so no variables are set and the match fails.
# This gives us a way of matching a list that meets certain criteria--in this case a legnth of 3, with 1
# as its second element.

bombs = [1, 2, 3]
[aaa, 1, bbb] = bombs
