import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ValidationPipe, Logger } from '@nestjs/common';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';

async function bootstrap() {
  const logger = new Logger('Bootstrap');
  const app = await NestFactory.create(AppModule);
  app.enableCors();


  app.useGlobalPipes(new ValidationPipe({
    whitelist: true,
    transform: true
  }));
  const config = new DocumentBuilder()
    .setTitle('Users API')
    .setDescription('API de leitura de usuários')
    .setVersion('1.0')
    .build();

  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document);

  const port = 3000;
  await app.listen(port);
  logger.log(`📄 Swagger disponível em http://localhost:${port}/api`);
}

bootstrap();
