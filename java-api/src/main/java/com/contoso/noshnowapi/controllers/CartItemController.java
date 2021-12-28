package com.contoso.noshnowapi.controllers;

import com.contoso.noshnowapi.apimodels.CartItemPostApiModel;
import com.contoso.noshnowapi.models.CartItem;
import com.contoso.noshnowapi.repositories.CartItemRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/cartitems")
public class CartItemController {
    private final CartItemRepository cartItemRepository;

    public CartItemController(CartItemRepository cartItemRepository) {
        this.cartItemRepository = cartItemRepository;
    }

    @GetMapping("/carts/{id}")
    public List<CartItem> getCartItems(@PathVariable Long id)
    {
        return cartItemRepository.findCartItemsByCartId(id);
    }

    @PostMapping
    public CartItem addCartItem(@RequestBody CartItemPostApiModel cartItemPostApiModel)
    {
        CartItem cartItem = new CartItem();
        cartItem.setCartId(cartItemPostApiModel.getCartId());
        cartItem.setItemId(cartItemPostApiModel.getItemId());
        cartItem.setQty(cartItemPostApiModel.getQty());
        return cartItemRepository.save(cartItem);
    }
}
