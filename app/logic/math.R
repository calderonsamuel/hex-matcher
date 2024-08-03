#' @export
generate_deck_indexes <- function(p) {
  # Number of symbols
  num_symbols <- p^2 + p + 1

  # Create a list of symbols
  symbols <- seq_len(num_symbols)

  # Initialize the deck
  deck <- list()

  # Create the first card with all symbols
  first_card <- symbols[1:(p + 1)]
  deck[[1]] <- first_card

  # Create p cards with (p + 1) symbols each, sharing one symbol with the first card
  for (i in 1:p) {
    card <- c(symbols[1], symbols[(i * p + 1):(i * p + p)])
    deck[[length(deck) + 1]] <- card
  }

  # Create remaining cards
  for (i in 1:p) {
    for (j in 1:p) {
      card <- c(symbols[i + 1])
      for (k in 1:p) {
        # Breaking down the expression into meaningful parts
        base_index <- p + 1
        offset_within_block <- (k - 1) * p
        symbol_position_within_block <- (j - 1 + (k - 1) * (i - 1)) %% p
        symbol_index <- base_index + offset_within_block + symbol_position_within_block + 1

        card <- c(card, symbols[symbol_index])
      }
      deck[[length(deck) + 1]] <- card
    }
  }

  return(deck)
}
