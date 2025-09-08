import { Controller, Get, Query, Param, NotFoundException } from '@nestjs/common';
import { UsersService } from '../service/users.service';
import { UserFilterDto } from '../dtos/user-filter.dto';
import { ApiTags, ApiQuery, ApiParam, ApiResponse } from '@nestjs/swagger';

@ApiTags('Users')
@Controller('users')
export class UsersController {
  private service = new UsersService();

  @Get()
  @ApiResponse({ status: 200, description: 'Lista de usuários com paginação.' })
  getUsers(@Query() filters: UserFilterDto) {
    return this.service.getUsers(filters);
  }

  @Get(':id')
  @ApiParam({ name: 'id', description: 'ID do usuário' })
  @ApiResponse({ status: 200, description: 'Usuário encontrado.' })
  @ApiResponse({ status: 404, description: 'Usuário não encontrado.' })
  getUser(@Param('id') id: string) {
    const user = this.service.getUserById(Number(id));
    if (!user) {
      throw new NotFoundException({
        message: 'Usuario não existe',
        code: 404
      });
    }
    return { success: true, data: user };
  }
}
