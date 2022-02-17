import           Lib                            ( isValidCard )
import           Test.Hspec                     ( describe
                                                , hspec
                                                , it
                                                , shouldBe
                                                )

validCardNumber :: [Int]
validCardNumber = [4, 5, 5, 6, 7, 3, 7, 5, 8, 6, 8, 9, 9, 8, 5, 5]

invalidCardNumber :: [Int]
invalidCardNumber = map (+ 1) validCardNumber

main :: IO ()
main = hspec $ do
  describe "isValidCard" $ do
    it "should return True for a number that is valid" $ do
      isValidCard validCardNumber `shouldBe` True

    it "should return False for a number that is not valid" $ do
      isValidCard invalidCardNumber `shouldBe` False
