package com.contoso.noshnowapi.repositories;

import com.contoso.noshnowapi.models.User;
import org.springframework.data.jpa.repository.*;

public interface IUserRepository extends JpaRepository<User, Long>, IUserRepositoryCustom {
}
