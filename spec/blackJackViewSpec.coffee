describe "BlackJack Main View", ->
	beforeEach ->
		window.blackjackView = new BlackjackView
		window.deck = new Deck()
		window.player = new Hand()

	it "should have two hands upon creation", ->
		expect(window.blackjackView.player).toBeDefined()
		expect(window.blackjackView.player).toBeDefined()

	describe "Players", ->
		it "should have a player hand with 2 cards on creation", ->
			expect(window.blackjackView.player.models.length).toEqual(2)

		it "should have a dealer hand with 2 cards on creation", ->
			expect(window.blackjackView.dealer.models.length).toEqual(2)

	describe "View methods", ->
		it "should have a deal method", ->
			expect(window.blackjackView.deal).toBeDefined()

		describe "Deal method", ->
			it "should add a single card to a hand", ->
				window.blackjackView.deal(window.player)
				expect(window.player.models.length).toEqual(1)

			it "should add two cards when called twice", ->
				window.blackjackView.deal(window.player)
				window.blackjackView.deal(window.player)
				expect(window.player.models.length).toEqual(2)

		it "should have a stand method", ->
			expect(window.blackjackView.stand).toBeDefined()

		it "should have a reset method", ->
			expect(window.blackjackView.reset).toBeDefined()