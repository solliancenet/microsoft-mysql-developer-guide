package com.contoso.noshnowapi.repositories;

import com.contoso.noshnowapi.models.CartItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CartItemRepository extends JpaRepository<CartItem, Long> {
    @Query(value = "SELECT ci.id, ci.cart, ci.item, ci.qty FROM Cart_Items ci JOIN Carts c ON ci.cart = c.id WHERE c.id = :cartId", nativeQuery = true)
    List<CartItem> findCartItemsByCartId(Long cartId);
}