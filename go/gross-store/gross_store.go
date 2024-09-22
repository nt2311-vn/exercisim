package gross

// Units stores the Gross Store unit measurements.
func Units() map[string]int {
	return map[string]int{
		"quarter_of_a_dozen": 3,
		"half_of_a_dozen":    6,
		"dozen":              12,
		"small_gross":        120,
		"gross":              144,
		"great_gross":        1728,
	}
}

// NewBill creates a new bill.
func NewBill() map[string]int {
	return map[string]int{}
}

// AddItem adds an item to customer bill.
func AddItem(bill, units map[string]int, item, unit string) bool {
	unitVal, unitExist := units[unit]
	if !unitExist {
		return false
	}

	itemVal, itemExisit := bill[item]

	if itemExisit {
		bill[item] = itemVal + unitVal
	} else {
		bill[item] = unitVal
	}
	return true
}

// RemoveItem removes an item from customer bill.
func RemoveItem(bill, units map[string]int, item, unit string) bool {
	unitVal, unitExist := units[unit]
	itemVal, itemExist := bill[item]

	if !unitExist || !itemExist {
		return false
	}
	remainQty := itemVal - unitVal
	switch {
	case remainQty < 0:
		return false
	case remainQty == 0:
		delete(bill, item)
		return true
	case remainQty > 0:
		bill[item] = remainQty
		return true
	}
	return false
}

// GetItem returns the quantity of an item that the customer has in his/her bill.
func GetItem(bill map[string]int, item string) (int, bool) {
	itemVal, itemExist := bill[item]

	return itemVal, itemExist
}
