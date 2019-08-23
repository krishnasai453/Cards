qdefmodule Cards do

	@moduledoc """
		Provides functions for handling deck of cards
	"""

	@doc """
		Returns a list of playing cards
	"""
	def create_deck do
		suits 	= ["Spades", "Clubs", "Hearts", "Diamonds"]
		values 	= ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
		for suit<-suits, value<-values do
			"#{value} of #{suit}"
		end
	end

	@doc """
		Shuffles a deck of playing cards
	"""
	def shuffle(deck) do
		Enum.shuffle(deck)
	end

	@doc """
		Divides the deck into hand and remaining cards in deck. Deals the card according to handsize provices

		## Examples

			iex> deck = Cards.create_deck
			iex> Cards.deal(deck, 1)
			["Ace of Spades"]

	"""
	def contains?(deck, card) do
		Enum.member?(deck, card)
	end

	@doc """
		Divides the deck into hand and remaining cards in deck. Deals the card according to handsize provices

		## Examples

			iex> deck = Cards.create_deck
			iex> Cards.deal(deck, 1)
			["Ace of Spades"]

	"""

	def  deal(deck, hand_size) do
		{deal_cards, _rest} = Enum.split(deck, hand_size)
		deal_cards
	end

	@doc """
		Saves the deck/hand of cards to filename provided
	"""
	def save(deck, filename) do
		binary = :erlang.term_to_binary(deck)
		File.write(filename, binary)
	end

		@doc """
			Loads the deck/hand of cards from filename provided
		"""
	def load(filename) do
		case File.read!(filename) do
			{:error, _reason} -> "The file doesnt exist"
			{:ok, bin}     -> :erlang.binary_to_term(bin)
		end
	end

		@doc """
			Creates, Shuffles and returns the cards according to handsize
		"""
	def create_hand(hand_size) do
		{hand, _rest}  = create_deck()
										|> shuffle()
										|> deal(hand_size)
	  hand
	end
end
