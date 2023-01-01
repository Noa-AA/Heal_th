package unhak.dao.face;

import java.util.List;

import unhak.dto.CartDto;

public interface OrderlistDao {

	/*주문 목록*/
	public List<CartDto> getOrder(int userNo);

}
