


numApt = 879
numFlr = 89
numBas = 9
shaftSQty = (numApt.to_f / (numFlr.to_f * 6)).ceil()
columnsQty = (numFlr.to_f / 20).ceil()
amntElevtr = shaftSQty * columnsQty
puts amntElevtr