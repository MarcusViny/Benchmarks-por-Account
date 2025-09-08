import users from '../mock-users.json';

export class UsersRepository {
  findAll(filters) {
    let data = users;

    if (filters.q) {
      const q = filters.q.toLowerCase();
      data = data.filter(
        u => u.name.toLowerCase().includes(q) || u.email.toLowerCase().includes(q)
      );
    }

    if (filters.role) data = data.filter(u => u.role === filters.role);
    if (filters.is_active !== undefined) data = data.filter(u => u.is_active === filters.is_active);

    return data;
  }

  findById(id: number) {
    return users.find(u => u.id === id);
  }
}
