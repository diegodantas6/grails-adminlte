<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">
			${title}
		</h3>
	</div>
	<form>
		<input type="hidden" id="id">
		
		<div class="box-body">
			<div class="col-sm-6 form-group">
				<label>Nome</label>
				<input type="text" class="form-control" id="nome">
			</div>
			
			<div class="col-sm-6 form-group">
				<label>CPF</label>
				<input type="text" class="form-control" id="cpf" data-inputmask="'mask': '999.999.999-99'" data-mask>
			</div>
			
			<input type="text" class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask>
			
			                  <!-- phone mask -->
                  <div class="form-group">
                    <label>Intl US phone mask:</label>
                    <div class="input-group">
                      <div class="input-group-addon">
                        <i class="fa fa-phone"></i>
                      </div>
                      <input type="text" class="form-control" data-inputmask="'mask': ['999-999-9999 [x99999]', '+099 99 99 9999[9]-9999']" data-mask>
                    </div><!-- /.input group -->
                  </div><!-- /.form group -->
			
			
		</div>
		<!-- /.box-body -->

		<div class="box-footer">
			<button type="reset" class="btn btn-danger"
				onclick="javascript: cancelar()">Cancelar</button>

			<button type="submit" class="btn btn-primary pull-right"
				onclick="javascript: salvar()">Salvar</button>
		</div>
	</form>
</div>
<!-- /.box -->
