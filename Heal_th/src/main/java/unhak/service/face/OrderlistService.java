package unhak.service.face;

import java.util.List;

import unhak.dto.CartDto;

public interface OrderlistService {

	public List<CartDto> getOrderList(int userNo);

}
