describe "Card Model", ->
	beforeEach ->
		window.card = new Card({cardID:0})

	it "should have an appropriate face value", ->
  	expect(window.card.get('name')).toEqual('Ace')

  it "should have the right numeric value", ->
  	expect(window.card.get('value')).toEqual(11)

  it "should not have the wrong value", ->
  	expect(window.card.get('value')).not.toEqual(4)

  it "should have the proper suit", ->
  	expect(window.card.get('suit')).toEqual('clubs')


describe "Deck Collection", ->
	beforeEach ->
		cards = _.shuffle([0..51])
		window.deck = (new Card({cardID: card}) for card in cards)

	it "should have 52 cards upon creation", ->
		expect(window.deck.length).toEqual(52)

	it "should have different cards at each position", ->
		window.card1 = window.deck[0]
		window.card2 = window.deck[1]
		expect(window.card1).not.toEqual(window.card2)


describe "Hand Collection", ->
	beforeEach ->
		## make a new deck
		window.cards = [0..51]
		window.deck = (new Card({cardID: card}) for card in window.cards)
		## make two new cards 
		window.card1 = new Card({cardID:window.deck[1]})
		window.card2 = new Card({cardID:window.deck[2]})
		## deal them into the hand
		window.hand = new Hand()
		window.hand.add(card1)
		window.hand.add(card2)

	it "should have two cards in it upon a fresh deal", ->
		expect(window.hand.length).toEqual(2)

	it "should have zero cards in it when reset before a new deal", ->
		window.hand.reset()
		expect(window.hand.length).toEqual(0)

	it "should add a single card to the hand when the hand takes a hit", ->
		window.hand.push(window.deck.pop())
		expect(window.hand.length).toEqual(3)

	it "should count 0 aces when the player has none", ->
		expect(window.hand.acesInHand()).toEqual(0)

	it "should count one ace when the player has one", ->
		window.card3 = window.deck[0]
		window.hand.push(window.card3)
		expect(window.hand.acesInHand()).toEqual(1)