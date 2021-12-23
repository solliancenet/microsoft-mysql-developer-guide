package com.contoso.noshnowapi.controllers;

import com.contoso.noshnowapi.models.Cart;
import com.contoso.noshnowapi.apimodels.CartPostApiModel;
import com.contoso.noshnowapi.repositories.CartRepository;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/carts")
public class CartController {

    private final CartRepository cartRepository;

    public CartController(CartRepository cartRepository) {
        this.cartRepository = cartRepository;
    }

    // The request just needs a user ID in the body
    // addCart() automatically populates the cart status
    @PostMapping
    public Cart addCart(@RequestBody CartPostApiModel cartPostViewModel)
    {
        Cart cart = new Cart();
        cart.setUser(cartPostViewModel.getUser());
        cart.setStatus("open");
        return cartRepository.save(cart);
    }
}
