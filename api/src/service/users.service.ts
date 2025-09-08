import { UsersRepository } from '../repositorio/users.repositorio';
import { UserFilterDto } from '../dtos/user-filter.dto';

export class UsersService {
  private repo = new UsersRepository();

  getUsers(filters: UserFilterDto) {
    const data = this.repo.findAll(filters);
    const totalItems = data.length;
    const page = filters.page || 1;
    const pageSize = filters.page_size || 10;

    const paginated = data.slice((page - 1) * pageSize, page * pageSize);

    return {
      data: paginated,
      pagination: {
        totalItems,
        page,
        pageSize,
        totalPages: Math.ceil(totalItems / pageSize),
      }
    };
  }

  getUserById(id: number) {
    return this.repo.findById(id) || null;
  }
}
