class Group
  constructor: (@customerID) ->
    
    # initialize w/ prefix and random customerID
    unless @customerID
      @customerID = @_getRandomInt @min, @max
    
    @code = @vendor + @customerID
    @checkSum = 0

    # UPC-A check digit algorithm
    for digit in @code
      # to Int
      digit = digit-0
    
      # odd*3 + even
      @checkSum += if digit % 2
        digit * 3 
      else
        digit
    
    @checkSum = 10 - @checkSum % 10
    @code += @checkSum

  _getRandomInt: (min, max) ->
    Math.floor Math.random() * (max - min + 1) + min
