module Util.Pretty (
  module Text.PrettyPrint.Annotated.Leijen,
  Sized(..), breakingSize, nestingSize,
  Pretty(..)
) where

--import Text.PrettyPrint.HughesPJ
import Text.PrettyPrint.Annotated.Leijen

-- A rough notion of size for pretty printing various types.
class Sized a where
  size :: a -> Int

instance (Sized a, Sized b) => Sized (a, b) where
  size (left, right) = 1 + size left + size right

instance Sized a => Sized [a] where
  size = sum . map size

-- The maximum size before we break on to another line.
breakingSize :: Int
breakingSize = 15

nestingSize :: Int
nestingSize = 1

class Pretty a ty where
  pretty :: a -> Doc ty


