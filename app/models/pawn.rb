class Pawn < Piece

  def valid_move?(new_x_coord, new_y_coord)
    x_distance = x_distance(new_x_coord)
    y_distance = y_distance(new_y_coord)

# ----- Opening move -----
    if y_coord == 2 && black?
      x_distance == 0 && (new_y_coord == 3 || new_y_coord == 4)
    elsif y_coord == 7 && white?
      x_distance == 0 && (new_y_coord == 6 || new_y_coord == 5)

# ----- Otherwise -------
    else
      if black?
        (x_distance == 0) && (new_y_coord == (y_coord + 1))
      elsif white? 
        (x_distance == 0) && (new_y_coord == (y_coord - 1))
      end
    end
  end

  def en_passant?(new_x_coord, new_y_coord)
    return false unless ((new_y_coord == y_coord + 1 && !white?) || (new_y_coord == y_coord - 1 && white?)) && ((new_x_coord == x_coord + 1) || (new_x_coord == x_coord - 1)) && ((new_y_coord == 3 && white?) || (new_y_coord == 6 && !white?))
    other_piece = game.pieces.where(y_coord: new_y_coord, x_coord: new_x_coord, type: "Pawn").first
    return false unless game.contains_piece?(new_x_coord, new_y_coord)
    raise "test"
    
    return false if other_piece.move_number != 1 
    return true
   end
end


