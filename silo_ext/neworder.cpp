#include "river.hh"
#include "interface.h"
#include "masstree_beta_wrapper.h"
#include "tpcc_query.hpp"

using namespace ccbench;

namespace TPCC {

#if TPCC_SMALL
const uint32_t g_max_items = 10000;
const int32_t g_cust_per_dist = 2000;
#else
const uint32_t g_max_items = 100000;
const uint32_t g_cust_per_dist = 3000;
#endif

//#define DIST_PER_WARE (10)

// Helper Functions
uint64_t distKey(uint64_t d_id, uint64_t d_w_id) {
	return d_w_id * DIST_PER_WARE + d_id;
}

uint64_t custKey(uint64_t c_id, uint64_t c_d_id, uint64_t c_w_id) {
	return (distKey(c_d_id, c_w_id) * g_cust_per_dist + c_id);
}

uint64_t stockKey(uint64_t s_i_id, uint64_t s_w_id) {
	return s_w_id * g_max_items + s_i_id;
}
	
void
run_new_order(TPCC::query::NewOrder *query) {
  Token token{};
	
	//itemid_t * item;
	//INDEX * index;
	
	bool remote = query->remote;
	uint64_t w_id = query->w_id;
	uint64_t d_id = query->d_id;
	uint64_t c_id = query->c_id;
	uint64_t ol_cnt = query->ol_cnt;

	/*=======================================================================+
		EXEC SQL SELECT c_discount, c_last, c_credit, w_tax
		INTO :c_discount, :c_last, :c_credit, :w_tax
		FROM customer, warehouse
		WHERE w_id = :w_id AND c_w_id = w_id AND c_d_id = :d_id AND c_id = :c_id;
		+========================================================================*/
	TPCC::Warehouse *wh;
	std::string strkey;
	strkey = wh->CreateKey(w_id);
	// index = _wl->i_warehouse; 
	// item = index_read(index, key, wh_to_part(w_id));
	Tuple *ret_tuple_ptr;
	Status stat;
	stat = search_key(token, Storage::WAREHOUSE, strkey, &ret_tuple_ptr);
	if (stat != Status::OK) ERR;
	wh = (TPCC::Warehouse *)ret_tuple_ptr->get_val().data();
	
	double w_tax;
	//uint64_t key = custKey(c_id, d_id, w_id);
	TPCC::Customer *cust;
	strkey = cust->CreateKey(c_id, d_id, w_id);
	stat = search_key(token, Storage::CUSTOMER, strkey, &ret_tuple_ptr); if (stat != Status::OK) ERR;
	cust = (TPCC::Customer *)ret_tuple_ptr->get_val().data();
	uint64_t c_discount = cust->C_DISCOUNT;
	char* c_last = cust->C_LAST;
	char* c_credit = cust->C_CREDIT;
	
	/*==================================================+
		EXEC SQL SELECT d_next_o_id, d_tax
		INTO :d_next_o_id, :d_tax
		FROM district WHERE d_id = :d_id AND d_w_id = :w_id;
		EXEC SQL UPDATE d istrict SET d _next_o_id = :d _next_o_id + 1
		WH ERE d _id = :d_id AN D d _w _id = :w _id ;
		+===================================================*/
	TPCC::District *dist;	
	strkey = dist->CreateKey(d_id, w_id);
	stat = search_key(token, Storage::DISTRICT, strkey, &ret_tuple_ptr); if (stat != Status::OK) ERR;
	dist = (TPCC::District *)ret_tuple_ptr->get_val().data();
	
	/*
	key = distKey(d_id, w_id);
	item = index_read(_wl->i_district, key, wh_to_part(w_id));
	assert(item != NULL);
	row_t * r_dist = ((row_t *)item->location);
	row_t * r_dist_local = get_row(r_dist, WR);
	if (r_dist_local == NULL) {
		return finish(Abort);
	}
	*/
	//double d_tax;
	double d_tax = dist->D_TAX;
	int64_t o_id = dist->D_NEXT_O_ID;
	o_id ++;
	dist->D_NEXT_O_ID = o_id;
	//r_dist_local->set_value(D_NEXT_O_ID, o_id);

	/*
	int64_t o_id;
	d_tax = *(double *) r_dist_local->get_value(D_TAX);
	o_id = *(int64_t *) r_dist_local->get_value(D_NEXT_O_ID);
	o_id ++;
	r_dist_local->set_value(D_NEXT_O_ID, o_id);
	*/

	/*========================================================================================+
		EXEC SQL INSERT INTO ORDERS (o_id, o_d_id, o_w_id, o_c_id, o_entry_d, o_ol_cnt, o_all_local)
		VALUES (:o_id, :d_id, :w_id, :c_id, :datetime, :o_ol_cnt, :o_all_local);
		+========================================================================================*/
	TPCC::Order order;
	uint64_t o_entry_d; // dummy data. Is it necessary?

	order.O_ID = o_id;
	order.O_C_ID = c_id;
	order.O_D_ID = d_id;
	order.O_W_ID = w_id;
	order.O_ENTRY_D = o_entry_d;
	order.O_OL_CNT = ol_cnt;
	int64_t all_local = (remote? 0 : 1);
	order.O_ALL_LOCAL = all_local;
	strkey = cust->CreateKey(order.O_W_ID, order.O_D_ID, order.O_ID);
	stat = insert(token, Storage::ORDER, strkey, {(char *)&order, sizeof(TPCC::Order)});
	if (stat != Status::OK) ERR;

#ifdef DBx1000
	row_t * r_order;
	uint64_t row_id;
	_wl->t_order->get_new_row(r_order, 0, row_id);
	r_order->set_value(O_ID, o_id);
	r_order->set_value(O_C_ID, c_id);
	r_order->set_value(O_D_ID, d_id);
	r_order->set_value(O_W_ID, w_id);
	r_order->set_value(O_ENTRY_D, o_entry_d);
	r_order->set_value(O_OL_CNT, ol_cnt);
	int64_t all_local = (remote? 0 : 1);
	r_order->set_value(O_ALL_LOCAL, all_local);
	insert_row(r_order, _wl->t_order);
#endif

	/*=======================================================+
    EXEC SQL INSERT INTO NEW_ORDER (no_o_id, no_d_id, no_w_id)
		VALUES (:o_id, :d_id, :w_id);
    +=======================================================*/

	TPCC::NewOrder neworder;
	neworder.NO_O_ID = o_id;
	neworder.NO_D_ID = d_id;
	neworder.NO_W_ID = w_id;

	strkey = neworder.CreateKey(neworder.NO_W_ID, neworder.NO_D_ID, neworder.NO_O_ID);
	stat = insert(token, Storage::NEWORDER, strkey, {(char *)&neworder, sizeof(TPCC::NewOrder)});
	if (stat != Status::OK) ERR;

	for (uint32_t ol_number = 0; ol_number < ol_cnt; ol_number++) {
		uint64_t ol_i_id = query->items[ol_number].ol_i_id;
		uint64_t ol_supply_w_id = query->items[ol_number].ol_supply_w_id;
		uint64_t ol_quantity = query->items[ol_number].ol_quantity;
				
		//OrderLine orderline;
		TPCC::Item* item;
		strkey = item->CreateKey(ol_i_id);
		stat = search_key(token, Storage::ITEM, strkey, &ret_tuple_ptr); if (stat != Status::OK) ERR;
		item = (TPCC::Item *)ret_tuple_ptr->get_val().data();

		int64_t i_price;
		char * i_name;
		char * i_data;
		i_price = item->I_PRICE;
		i_name = item->I_NAME;
		i_data = item->I_DATA;


#ifdef DBx1000
	row_t * r_no;
	_wl->t_neworder->get_new_row(r_no, 0, row_id);
	r_no->set_value(NO_O_ID, o_id);
	r_no->set_value(NO_D_ID, d_id);
	r_no->set_value(NO_W_ID, w_id);
	insert_row(r_no, _wl->t_neworder);

	for (UInt32 ol_number = 0; ol_number < ol_cnt; ol_number++) {
		uint64_t ol_i_id = query->items[ol_number].ol_i_id;
		uint64_t ol_supply_w_id = query->items[ol_number].ol_supply_w_id;
		uint64_t ol_quantity = query->items[ol_number].ol_quantity;
		/*===========================================+
			EXEC SQL SELECT i_price, i_name , i_data
			INTO :i_price, :i_name, :i_data
			FROM item
			WHERE i_id = :ol_i_id;
			+===========================================*/
		key = ol_i_id;
		item = index_read(_wl->i_item, key, 0);
		assert(item != NULL);
		row_t * r_item = ((row_t *)item->location);
		row_t * r_item_local = get_row(r_item, RD);
		if (r_item_local == NULL) {
			return finish(Abort);
		}
		int64_t i_price;
		char * i_name;
		char * i_data;
		r_item_local->get_value(I_PRICE, i_price);
		i_name = r_item_local->get_value(I_NAME);
		i_data = r_item_local->get_value(I_DATA);
#endif

		/*===================================================================+
			EXEC SQL SELECT s_quantity, s_data,
			s_dist_01, s_dist_02, s_dist_03, s_dist_04, s_dist_05,
			s_dist_06, s_dist_07, s_dist_08, s_dist_09, s_dist_10
			INTO :s_quantity, :s_data,
			:s_dist_01, :s_dist_02, :s_dist_03, :s_dist_04, :s_dist_05,
			:s_dist_06, :s_dist_07, :s_dist_08, :s_dist_09, :s_dist_10
			FROM stock
			WHERE s_i_id = :ol_i_id AND s_w_id = :ol_supply_w_id;
			EXEC SQL UPDATE stock SET s_quantity = :s_quantity
			WHERE s_i_id = :ol_i_id
			AND s_w_id = :ol_supply_w_id;
			+===============================================*/

		//uint64_t stock_key = stockKey(ol_i_id, ol_supply_w_id);
		TPCC::Stock* stock;
		strkey = stock->CreateKey(ol_supply_w_id, ol_i_id);
		stat = search_key(token, Storage::STOCK, strkey, &ret_tuple_ptr); if (stat != Status::OK) ERR;
		stock = (TPCC::Stock *)ret_tuple_ptr->get_val().data();

		uint64_t s_quantity;
		int64_t s_remote_cnt;
		s_quantity = (int64_t)stock->S_QUANTITY;
		
#if !TPCC_SMALL
		int64_t s_ytd;
		int64_t s_order_cnt;

		s_ytd = stock->S_YTD;
		stock->S_YTD = s_ytd + ol_quantity;
		s_order_cnt = stock->S_ORDER_CNT;
		stock->S_ORDER_CNT = s_order_cnt + 1;
		char* s_data = stock->S_DATA;
#endif

		if (remote) {
			s_remote_cnt = (int64_t)stock->S_REMOTE_CNT;
			s_remote_cnt++;
			stock->S_REMOTE_CNT = s_remote_cnt;
		}
		uint64_t quantity;
		if (s_quantity > ol_quantity + 10) {
			quantity = s_quantity - ol_quantity;
		} else {
			quantity = s_quantity - ol_quantity + 91; // 91????
		}
		stock->S_QUANTITY = quantity;

#ifdef DBx1000
		uint64_t stock_key = stockKey(ol_i_id, ol_supply_w_id);
		INDEX * stock_index = _wl->i_stock;
		itemid_t * stock_item;
		index_read(stock_index, stock_key, wh_to_part(ol_supply_w_id), stock_item);
		assert(item != NULL);
		row_t * r_stock = ((row_t *)stock_item->location);
		row_t * r_stock_local = get_row(r_stock, WR);
		if (r_stock_local == NULL) {
			return finish(Abort);
		}
		
		// XXX s_dist_xx are not retrieved.
		UInt64 s_quantity;
		int64_t s_remote_cnt;
		s_quantity = *(int64_t *)r_stock_local->get_value(S_QUANTITY);

#if !TPCC_SMALL
		int64_t s_ytd;
		int64_t s_order_cnt;
		r_stock_local->get_value(S_YTD, s_ytd);
		r_stock_local->set_value(S_YTD, s_ytd + ol_quantity);
		r_stock_local->get_value(S_ORDER_CNT, s_order_cnt);
		r_stock_local->set_value(S_ORDER_CNT, s_order_cnt + 1);
		s_data = r_stock_local->get_value(S_DATA);
#endif

		if (remote) {
			s_remote_cnt = *(int64_t*)r_stock_local->get_value(S_REMOTE_CNT);
			s_remote_cnt ++;
			r_stock_local->set_value(S_REMOTE_CNT, &s_remote_cnt);
		}
		uint64_t quantity;
		if (s_quantity > ol_quantity + 10) {
			quantity = s_quantity - ol_quantity;
		} else {
			quantity = s_quantity - ol_quantity + 91;
		}
		r_stock_local->set_value(S_QUANTITY, &quantity);

#endif

		/*====================================================+
			EXEC SQL INSERT
			INTO order_line(ol_o_id, ol_d_id, ol_w_id, ol_number,
			ol_i_id, ol_supply_w_id,
			ol_quantity, ol_amount, ol_dist_info)
			VALUES(:o_id, :d_id, :w_id, :ol_number,
			:ol_i_id, :ol_supply_w_id,
			:ol_quantity, :ol_amount, :ol_dist_info);
			+====================================================*/
		// XXX district info is not inserted.

		//row_t * r_ol;
		//uint64_t row_id;
		//_wl->t_orderline->get_new_row(r_ol, 0, row_id);
		TPCC::OrderLine orderline;
		orderline.OL_O_ID = o_id;
		orderline.OL_D_ID = d_id;
		orderline.OL_W_ID = w_id;
		orderline.OL_NUMBER = ol_number;
		orderline.OL_I_ID = ol_i_id;

#if !TPCC_SMALL
		int w_tax=1, d_tax=1;
		int64_t ol_amount = ol_quantity * i_price * (1 + w_tax + d_tax) * (1 - c_discount);
		orderline.OL_SUPPLY_W_ID = ol_supply_w_id;
		orderline.OL_QUANTITY = ol_quantity;
		orderline.OL_AMOUNT = ol_amount;
#endif		
		// The number of keys is enough? It is different from DBx1000
		strkey = orderline.CreateKey(orderline.OL_W_ID, orderline.OL_D_ID, orderline.OL_O_ID, orderline.OL_NUMBER);
		stat = insert(token, Storage::ORDERLINE, strkey, {(char *)&orderline, sizeof(TPCC::OrderLine)});
		if (stat != Status::OK) ERR;

#ifdef DBx1000
		row_t * r_ol;
		uint64_t row_id;
		_wl->t_orderline->get_new_row(r_ol, 0, row_id);
		r_ol->set_value(OL_O_ID, &o_id);
		r_ol->set_value(OL_D_ID, &d_id);
		r_ol->set_value(OL_W_ID, &w_id);
		r_ol->set_value(OL_NUMBER, &ol_number);
		r_ol->set_value(OL_I_ID, &ol_i_id);

#if !TPCC_SMALL
		int w_tax=1, d_tax=1;
		int64_t ol_amount = ol_quantity * i_price * (1 + w_tax + d_tax) * (1 - c_discount);
		r_ol->set_value(OL_SUPPLY_W_ID, &ol_supply_w_id);
		r_ol->set_value(OL_QUANTITY, &ol_quantity);
		r_ol->set_value(OL_AMOUNT, &ol_amount);
#endif		
		insert_row(r_ol, _wl->t_orderline);
	}
	assert( rc == RCOK );

	//return finish(rc);
#endif
	} // end of ol loop
} // run tpcc
} // namespace TPCC