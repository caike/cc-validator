import           Lib                            ( isValidCard )
import           Test.Hspec                     ( describe
                                                , hspec
                                                , it
                                                , shouldBe
                                                )

main :: IO ()
main = hspec $ do
  describe "isValidCard" $ do
    it "should return True for a number that is valid" $ do
      isValidCard validCardNumber1 `shouldBe` True
      isValidCard validCardNumber2 `shouldBe` True
      isValidCard validCardNumber3 `shouldBe` True
      isValidCard validCardNumber4 `shouldBe` True

    it "should return False for a number that is not valid" $ do
      isValidCard invalidCardNumber1 `shouldBe` False
      isValidCard invalidCardNumber2 `shouldBe` False
      isValidCard invalidCardNumber3 `shouldBe` False
      isValidCard invalidCardNumber4 `shouldBe` True

type CreditCardNumber = [Int]

validCardNumber1 :: CreditCardNumber
validCardNumber1 = [4, 5, 5, 6, 7, 3, 7, 5, 8, 6, 8, 9, 9, 8, 5, 5]

invalidCardNumber1 :: CreditCardNumber
invalidCardNumber1 = map (+ 1) validCardNumber1

 -- Mastercard
validCardNumber2 :: CreditCardNumber
validCardNumber2 = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4]

invalidCardNumber2 :: CreditCardNumber
invalidCardNumber2 = map (+ 1) validCardNumber2

-- Mastercard
validCardNumber3 :: CreditCardNumber
validCardNumber3 = [5, 1, 0, 5, 1, 0, 5, 1, 0, 5, 1, 0, 5, 1, 0, 0]

invalidCardNumber3 :: CreditCardNumber
invalidCardNumber3 = map (+ 1) validCardNumber3

-- Visa
validCardNumber4 :: CreditCardNumber
validCardNumber4 = [4, 0, 1, 2, 8, 8, 8, 8, 8, 8, 8, 8, 1, 8, 8, 1]

invalidCardNumber4 :: CreditCardNumber
invalidCardNumber4 = map (+ 1) validCardNumber3
