class Group
  constructor: (@customerID)->
    # initialize w/ prefix and random customerID
    if not @customerID then @customerID = @_getRandomInt @min, @max
    @code = @vendor + @customerID
    @checkSum = 0

    #  UPC-A check digit algorithm
    for digit in @code
      # to Int
      digit = digit-0
      # odd*3 + even
      if digit % 2 then @checkSum += (digit * 3 ) else @checkSum += digit
    @checkSum = 10 - @checkSum % 10
    @code += @checkSum

  _getRandomInt: (min, max) ->
    Math.floor Math.random() * (max - min + 1) + min
